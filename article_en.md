# Bitcoin deposits for deals (Howto)

Bitcoin is a very convenient and reliable as a storage of money.
But how can you carry out deals with it?
Traditional methods introduce a trusted third party.
Bitcoin turned out to be powerful enough to carry out
deals safely without involment of third parties.
Below is detailed instruction how to carry out a deal with
anybody you do not trust without involment of third parties.

![esrow](http://i.imgur.com/5l657XE.png)
![bitcoin](http://i.imgur.com/MFLibRr.jpg)

Let us review existing methods at first.

### Exchange bitcoin to traditional money

Using this method, you rely on existing laws protecting
both parties from each other.
This violates the principle of third parties exclusion.
Moreover, no anonymity. And exchange fees are added.
Furthermore, bitcoin economy is growing, when you
make transactions in bitcoins directly,
not in traditional money.

### Escrow

An escrow is a third party trusted by both parties to the transaction.
Buyer gives money to escrow, seller gives the goods to escrow.
Then escrow gives money to seller and the goods to buyer.
This method has a drawback.
Escrow has to accumulate reputation.
The more reputation, the more deals mediated by the escrow.
Escrow is a system with positive feedback, therefore
number of escrows decreases, which results in centralization.
We do not like centralization.

### How to carry out a deal without third parties

My point is that third parties are not needed for a bitcoin deal.
A buyer, a seller and the bitcoin itself are sufficient
for a secure deal.
Banks, money exchange, lawyers and escrow are parasitizing
on deals.
Protocol of bitcoin already has all you need to
carry out a secure deal.

**The algorithm is very simple: both parties deposite some money.
If the deal succeeds, the money is returned, otherwise lost.**

Start from learning what
[multisig address](https://en.bitcoin.it/wiki/Address#Multi-signature_addresses)
is.
Debiting the multisig address needs several signatures.
Popular multisig address types are 2/2 and 2/3.
Debiting 2/2 multisig address needs 2 signatures of 2.
Debiting 2/2 multisig address needs 2 signatures of 3.

The buyer and the seller create multisig 2/2 address
and move their money to it.
None of them can get his money back without approval
by other party.
After this the deal itself is carried about
(let it be a purchase of goods or a provision of services
for bitcoin).
If the deal succeeds (the buyer gets the goods, the seller
gets the money), the parties of the deal take the money
back from the deposite.
If a conflict occurs or one party just disappears,
they both lose the money deposited.

Parties depend on each other. The risk of losing money
is stronger argument than the law regular deals based on.
Some people accept violation of the law, but no one
wants to lose money.
In my opinion, the money is the most powerful argument in the economy.
It makes no sense to cheat if it obviously leads to losses.

In order for this method to work, deposited money must
exceed the price of the goods.
Otherwise the party getting the goods or the money first,
can pull the plug on the deposite and disappear.
In my opinion, **each party must deposite the double price
of goods**.

Another pitfall: after one party deposited the money,
other party can disappear (sabotage or joke).
This is bad, because one party loses the money
and another party doesn't lose anything.
Fortunately bitcoin provides the workaround.
The money is deposited from both parties by one bitcoin
transaction. This means that either both parties
deposite the money or none of them deposits.

The final diagram:

![](http://i.imgur.com/5l657XE.png)

Price of the goods is 1 BTC. Each party deposites 2 BTC.

1.  Alice and Bob create common multisig 2/2 address to be used
    as deposite storage.
2.  Alice and Bob sign the transaction, moving
    2 BTC from Alice's wallet to the multisig 2/2 address and
    2 BTC from Bob's wallet to the multisig 2/2 address.
3.  The deal itself:
    -   Alice provides services to Bob.
    -   Bob pays 1 BTC to Alice.
4.  Alice and Bob take the money back from the deposite
    to their personal wallets.

This algorithm is a wrapper for any deal.
All the overhead is fees of 2 bitcoin transactions
(to and from deposite).
If transactions refilling personal wallets are counted as well
(see below "Preparation"), then all the fee is 4 transaction fees
(0.0004 BTC).

If the deal includes private meeting, then moving the money
to and from a deposite can happen before and after the private meeting.
Moreover, participants of a private meeting feel better
if they are bound by the deposite instead of being
just strangers.
The method described works well for distant deals as well
(e.g., a person from one country sells an intellectual product
to a person from other country).
Several consequent deals may happen "inside"
one deposite.

### Implementation

Graphical tools I use do not provide convenient interface
to carry two transactions needed (I use bitcoin-qt and Electrum).
Web client [coinbin](https://coinb.in/)
based on [BitcoinJS](http://bitcoinjs.org/)
provides.
The client doesn't depend on the developer's server
and doesn't store keys remotely.
Furthermore, coinbin can be
[downloaded](https://github.com/OutCast3k/coinbin/archive/master.zip)
and used locally or uploaded to own server.
E-mail and password are used as seed for keys generation.
To posses multiple addresses, use several pairs (E-mail, password).
Backup your E-mail and password not to lose access to the wallet.
[KeePassX](https://www.keepassx.org/) is a good place for this.

I managed to accomplish the transactions needed for
securing a deal.
Step-by-step instruction is below.

#### Preparation

1.  Alice and Bob create coinbin wallets
    ([pic](http://i.imgur.com/xWV35gc.png)).
2.  See keys, backup private keys, tell each other their
    public keys and addresses
    ([pic](http://i.imgur.com/Bph3789.png)).
3.  Send the money to be deposited to coinbin addresses
    (0.01 BTC from each of them)
    ([pic](http://i.imgur.com/K8gooL1.png)).
4.  Alice creates multisig 2/2 address
    -   Finds MultiSig Address in coinbin menu
        ([pic](http://i.imgur.com/OivaZnW.png)).
        The [form](http://i.imgur.com/Bdasncz.png) is shown.
    -   Fill the form with public keys of her and Bob
        ([pic](http://i.imgur.com/gAF538K.png)).
    -   Backups resulting address and Redeem Script
        and send them to Bob
        ([pic](http://i.imgur.com/2Tv7AAX.png)).
5.  Bob verifies Redeem Script
    -   Selects Verify in coinbin menu
        ([pic](http://i.imgur.com/2NpTwOj.png)).
    -   Enters Redeem Script and compares public keys,
        address and that Required Signatures = 2
        ([pic](https://i.imgur.com/NtzBRO8.png)).
        **Clarification**: Bob knows his public key and Alice's
        public key sent to him previously.
        He gets the address of multisig 2/2 along with
        Redeem Script.
        Required Signatures is the number of signatures
        required for debiting multisig 2/2 address,
        so it is 2.

#### Depositing money

1.  Alice creates a transaction moving the money to multisig 2/2 address
    (that is depositing the money)
    -   Selects Transaction in coinbin menu
        ([pic](https://i.imgur.com/WxP9g4i.png)).
    -   Goes to Advanced Options, unchecks Clear existing inputs...
        ([pic](http://i.imgur.com/Rc54mb0.png)).
    -   Enters first paying address (Alice's) as an Input
        ([pic](http://i.imgur.com/qI3TJCH.png)).
    -   Enters second paying address (Bob's) as an Input
        ([pic](http://i.imgur.com/sscFtfY.png)).
    -   Enters multisig 2/2 address as an Output.
        Amount of money is sum of inputs minus
        bitcoin transaction fee
        ([pic](http://i.imgur.com/0YFlfYd.png)).
    -   Gets Transaction Script and sends it to Bob for verification
        ([pic](http://i.imgur.com/2TZuyXr.png)).

2.  Bob verifies Transaction Script
    -   Selects Verify in coinbin menu
        ([pic](http://i.imgur.com/ATPIxC7.png)).
    -   Enters Transaction Script and makes sure
        multisig address and true amount of money are in Outputs
        ([pic](http://i.imgur.com/InxmBla.png)).

3.  Alice and Bob sign the Transaction Script one after another
    -   Alice selects Sign in coinbin menu
        ([pic](http://i.imgur.com/k0Od2Xr.png)).
    -   Alice enters Transaction Script and her private key
        ([pic](http://i.imgur.com/k0Od2Xr.png)).
    -   Alice gets partly signed transaction and sends it to Bob
        ([pic](http://i.imgur.com/MAPOGDv.png)).
    -   Bob verifies the transaction one more time and makes sure
        output address (multisig) and amount of money
        have not changed.
    -   Bob completes signing the transaction
        (same actions like for Alice part of signing,
        but uses party signed Transaction Script instead of
        original one)
        ([pic](http://i.imgur.com/qmk1BeT.png)).
    -   Bob verifies the transaction one more time and makes sure
        column Signed is marked for each row
        ([pic](https://i.imgur.com/LPxNLvZ.png)).
    -   Bob selects Broadcast in coinbin menu
        ([pic](http://i.imgur.com/LjWRrSK.png)).
    -   Bob enters Transaction Script and presses Submit
        ([pic](http://i.imgur.com/MtnFVak.png)).

The money has been deposited and
they can switch to the deal itself.

#### Getting deposited money back

If the deal fails, both parties lose deposited money.
(This is the whole point, making another party
conscientiously fulfill the conditions of the deal
under pain of losing money.)
If the deal succeeds, parties move the money back from
the deposite to their personal wallets.
This is possible only if both parties agree.

1.  Alice creates a transaction moving money from the multisig 2/2 address
    to personal wallets of Alice and Bob.
    -   Selects Transaction in coinbin menu
        ([pic](https://i.imgur.com/WxP9g4i.png)).
    -   Clears all inputs and outputs left over from
        previous transaction
        ([pic](http://i.imgur.com/avIRd4e.png)).
    -   Enters Redeem Script (see Preparation)
        ([pic](https://i.imgur.com/jHHdz2P.png)).
    -   Enters personal addresses of Alice and Bob as Outputs
        ([pic](http://i.imgur.com/rf5DaHK.png)).
    -   Gets Transaction Script and sends it to Bob for verification
        ([pic](http://i.imgur.com/DUUzjoO.png)).

2.  Bob verifies Transaction Script
    (finds his personal address and checks amount of money)
3.  Alice signs Transaction Script and sends it to Bob
4.  Bob verifies Transaction Script one moretime
    (finds his personal address and checks amount of money)
5.  Bob signs Transaction Script and broadcasts the result.

The money has been moved from the deposite back to personal
addresses of Alice and Bob.
The deal is over.

### Conclusions

The algorithm described acts as fraud protection for any deal.
It doesn't introduce third parties as traditional methods do.
Overhead is almost no.
The algorithm is not complicated even if it looks so.
I mastered the technique after two "deals" with myself.

Improvements of the algorithm and software
implementation are welcome.

### Links

1. [GitHub](https://github.com/OutCast3k/coinbin)
1. Bitcoin address of coinbin developer: 1CWHWkTWaq1K5hevimJia3cyinQsrgXUvg
1. Bitcoin address of the instruction author: 1CsfihQGy5kg3nnTJLzfmNDiPGqiQgdeMz

