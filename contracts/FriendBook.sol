// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract FriendBook {
    // Partners
    struct Message {
        address sender;
        address reciever;
        string content;
    }

    Message[] messages;

    //submit message
    function submitMessage(string memory content, address reciever)
        public
        returns (Message memory)
    {
        Message memory newMessage = Message(msg.sender, reciever, content);
        messages.push(newMessage);
        return newMessage;
    }

    //get all messages
    function getAllMessages() public view returns (Message[] memory) {
        return messages;
    }

    //get user messages
    function getCallerMessages() public view returns (Message[] memory) {
        uint256 messagesCount = 0;
        for (uint256 i = 0; i < messages.length; i++) {
            if (msg.sender == messages[i].reciever) {
                messagesCount++;
            }
        }

        Message[] memory callerMessages = new Message[](messagesCount);
        if (messagesCount > 0) {
            uint256 j = 0;
            for (uint256 i = 0; i < messages.length; i++) {
                if (msg.sender == messages[i].reciever) {
                    callerMessages[j] = messages[i];
                    j++;
                }
            }
        }

        return callerMessages;
    }
}
