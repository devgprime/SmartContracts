// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.0;

contract C{

    struct Room{
        bytes32 name;
        string occupant;
        bool occupied;
    }

    Room[] public rooms;


    constructor (bytes32[] memory names){
        for(uint i=0; i<names.length;i++){
        rooms.push(Room({
            name : names[i],
            occupied : false,
            occupant : "none"
        }));
    
    }
    }
function assignRoom(bytes32 roomName, string memory occupantName) public returns(string memory){
            for (uint i=0; i<rooms.length;i++){
            if(rooms[i].name==roomName){
                if(rooms[i].occupied==true){
                    return "room occupied";
                }

                else{
                    rooms[i].occupant=occupantName;
                    rooms[i].occupied=true;
                    return "assigned";
                }
            }
       }
    }
}