// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// creating magic token , mint ,
contract MagicToken {
    string public name = "MagicToken";
    string public symbol = "MAGIC";
    uint8 public decimal = 18; // check why not uint256 ? , this allow to split it in fraction
    uint256 public totalSupply = 1000000 * 10 ** 18; // or 1Million *e18

    //create mappping
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    //runs once the contract is deployed
    constructor() {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply); //emit i.e  shout or echo what you did

        //address(0) (also written as 0x0000000000000000000000000000000000000000) is: mint origin
        //A special address , Not owned by any private key ,Cannot be accessed ,Used for minting and burning events
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Not enough Magic Token");
        balanceOf[msg.sender] -= _amount; //CEI - must be checked
        balanceOf[_to] += _amount; // we add to receiver address

        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}
