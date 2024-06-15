const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

async function updateCardsCount() {
  const collectionsRef = db.collectionGroup('collections');

  try {
    const snapshot = await collectionsRef.get();

    const promises = [];

    snapshot.forEach(doc => {
      const collectionId = doc.id;
      const cardsRef = doc.ref.collection('cards');

      // Get the count of cards in each collection
      const cardsCountPromise = cardsRef.get().then(cardsSnapshot => cardsSnapshot.size);

      // Update the 'cardsCount' field for each collection
      const updatePromise = cardsCountPromise.then(cardsCount =>
        doc.ref.update({ cardsCount: cardsCount })
      );

      promises.push(updatePromise);
    });

    await Promise.all(promises);
    console.log('Cards count updated successfully for all collections.');
  } catch (error) {
    console.error('Error updating cards count:', error);
  }
}

updateCardsCount();