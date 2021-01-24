class Listing {
  String title;
  String description;
  String message;
  int fundRequired;
  int currentFund;
  int likes;
  int shares;
  int comments;
  String imageUrl;
  String location;

  Listing(this.title, this.description, this.message, this.location,
      this.fundRequired, this.imageUrl,
      [this.currentFund = 0,
      this.likes = 0,
      this.comments = 0,
      this.shares = 0]);
}
