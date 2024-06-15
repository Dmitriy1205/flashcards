const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.updateCardsCount = functions.firestore
  .document('/users/{userId}/collections/{collectionId}/cards/{cardId}')
  .onWrite(async (change, context) => {
    const userId = context.params.userId;
    const collectionId = context.params.collectionId;

    // Get a reference to the parent collection
    const collectionRef = admin.firestore().collection(`/users/${userId}/collections`).doc(collectionId);

    try {
      // Get the current count of cards in the collection
      const cardsSnapshot = await collectionRef.collection('cards').get();
      const cardsCount = cardsSnapshot.size;

      // Update the 'cardsCount' field in the collection document
      await collectionRef.update({ cardsCount: cardsCount });
      console.log(`Updated 'cardsCount' for collection ${collectionId} to ${cardsCount}`);
    } catch (error) {
      console.error('Error updating cards count:', error);
    }
  });