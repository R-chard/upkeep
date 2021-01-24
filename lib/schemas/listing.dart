class Listing {
  String title;
  String description;
  String message;
  int fundRequired;
  int currentFund;
  int likes;
  int shares;
  int comments;
  String profilePic;
  String owner;
  String imageUrl;
  String location;

  Listing(this.title, this.description, this.message, this.location,
      this.fundRequired, this.imageUrl, this.owner,
      [this.currentFund = 0,
      this.profilePic =
          "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
      this.likes = 0,
      this.comments = 0,
      this.shares = 0]);
}
