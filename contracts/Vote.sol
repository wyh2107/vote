//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote{
    //投票人结构体
    struct Voter{
        uint256 amount;
        bool isVoted;
        address delegator; //代理人地址
        uint256 targetId; //目标ID
    }

    //投票看板结构体
    struct Board{
        string name;
        uint256 totalAmount;
    }

    address public host; // 主持人 
    //投票人集合
    mapping(address => Voter) public voters; //

    //看板结合
    Board[] public boards;

    constructor(string[] memory nameList) {
        //初始化主持人地址
        host = msg.sender;
        //给主持人初始化一票
        voters[host].amount = 1;
        //初始化board
        for (uint256 i = 0; i < nameList.length; i ++) {
            //初始化被选举者集合
            Board memory item = Board(nameList[i], 0);
            boards.push(item);
        }

 //["li si", "wang wu", "alex"]
 //0xd9145CCE52D386f254917e481eB44e9943F39138

    }

}