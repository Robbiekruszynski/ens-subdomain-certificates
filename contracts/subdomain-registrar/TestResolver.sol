pragma solidity ^0.5.0;

import "../ens/ENS.sol";
import "./Resolver.sol";

/**
 * @dev A test resolver implementation
 */
contract TestResolver is Resolver {
    ENS ens;

    mapping (bytes32 => address) addresses;

    constructor(ENS _ens) public {
        ens = _ens;
    }

    function supportsInterface(bytes4 interfaceID) public pure returns (bool) {
        return interfaceID == 0x01ffc9a7 || interfaceID == 0x3b3b57de;
    }

    function addr(bytes32 node) public view returns (address) {
        return addresses[node];
    }

    function setAddr(bytes32 node, address addr) public {
        require(ens.owner(node) == msg.sender);
        addresses[node] = addr;
    }
}
