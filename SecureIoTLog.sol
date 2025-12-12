// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureIoTLog {

    address public admin;

    struct DataRecord {
        uint256 id;
        address deviceId;
        int256 temperature;
        uint256 timestamp;
        string location;
    }

    DataRecord[] public records;

    mapping(address => bool) public authorizedDevices;

    event DeviceAuthorized(address indexed device, uint256 time);
    event DeviceRevoked(address indexed device, uint256 time);
    event DataLogged(uint256 indexed recordId, address indexed device, int256 temp, uint256 time);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Security Alert: Caller is not the Admin");
        _;
    }

    modifier onlyAuthorized() {
        require(authorizedDevices[msg.sender] == true, "Security Alert: Unauthorized Device - Impersonation Attempt Detected");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function authorizeDevice(address _device) public onlyAdmin {
        authorizedDevices[_device] = true;
        emit DeviceAuthorized(_device, block.timestamp);
    }

    function revokeDevice(address _device) public onlyAdmin {
        authorizedDevices[_device] = false;
        emit DeviceRevoked(_device, block.timestamp);
    }

    function recordData(int256 _temp, string memory _location) public onlyAuthorized {
        
        uint256 newId = records.length;
        
        records.push(DataRecord({
            id: newId,
            deviceId: msg.sender,
            temperature: _temp,
            timestamp: block.timestamp,
            location: _location
        }));

        emit DataLogged(newId, msg.sender, _temp, block.timestamp);
    }

    function getRecordCount() public view returns (uint256) {
        return records.length;
    }
    
    function getRecord(uint256 _index) public view returns (address, int256, uint256, string memory) {
        require(_index < records.length, "Record does not exist");
        DataRecord memory r = records[_index];
        return (r.deviceId, r.temperature, r.timestamp, r.location);
    }
}