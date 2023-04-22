* What is hashing and why is it preferred over symmetric encryption for storing passwords?
	* Google it.
	* Transcribe the definitions and reasons in my own words.
* What is a Rainbow Table and how is it used to crack hashed passwords?
	* Google and transcribe.
* Try to crack the two passwords in the assignment using a Rainbow Table.
* Create a new user in Linux with the password 12345. Look up the corresponding hash in a Rainbow Table.
* Compare the password hash located in `/etc/shadow` with a peer and read about salting.

$6$2p5YGqSuEV5FCwGL$76AtUjZStcf5a0/JRFXnHYLYsodgVPxt62pHYXxSYi0DtMoDsln11hkDgAtO.8AiGiME6k2H2VMmvfpu7ep08/:19469:0:99999:7:::

[Password hashing](https://auth0.com/blog/hashing-passwords-one-way-road-to-security/)
[Rainbow tables](https://nordvpn.com/nl/blog/what-is-rainbow-table-attack/)
[Password salting](https://auth0.com/blog/adding-salt-to-hashing-a-better-way-to-store-passwords/)


There are multiple ways to store passwords on a server that authenticates users. The simplest is a table where each username and password is stored in *cleartext*, or without encryption. This is insecure: if the database is stolen, every user is compromised. Password hashing is a one-way transformation of a plaintext password into illegible data. Salting takes this one step further,

#### Password hashing
Password hashing is the cryptographic process of converting plaintext into a fixed-length string of characters. The length depends on the algorithm used. For example, the SHA-256 algorithm will create a 256-bit length string; or 64 hexadecimal characters. This is independent of the password's length in plaintext. In addition, the contents of the password have little outcome on the result of the hash. `12345` will result in a very different hash from `12346`.

Hashing is typically irreversible due to the mathematical functions used. For example, by using [modulo operators](https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/what-is-modular-arithmetic) that leave only a whole-number remainder as the result of the mathematical operation. With a given result, it is impossible to find the operation used to calculate it.

Finally, hashing is deterministic. That is to say, if one inputs a specific string of plaintext it will always result in the same hash. This makes it easy to compare a password input to a stored hash, but also leaves a stolen database vulnerable to a rainbow table attack.

#### Password salting


#### Rainbow Tables
