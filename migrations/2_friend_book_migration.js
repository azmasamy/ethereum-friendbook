const FriendBook = artifacts.require("FriendBook");

module.exports = function (deployer) {
  deployer.deploy(FriendBook);
};
