// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Provenance {
    struct Item {
        string name;
        string location;
        uint256 timestamp;
        address collector;
    }

    Item[] public items;

    function addItem(string memory _name, string memory _location) public {
        items.push(Item({
            name: _name,
            location: _location,
            timestamp: block.timestamp,
            collector: msg.sender
        }));
    }

    function getItem(uint index) public view returns (Item memory) {
        require(index < items.length, "Invalid index");
        return items[index];
    }

    function itemCount() public view returns (uint) {
        return items.length;
    }
}
