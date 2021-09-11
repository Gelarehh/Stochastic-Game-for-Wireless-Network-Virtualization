# Stochastic-Game-for-Wireless-Network-Virtualization

## Abstract
In the main paper's framework, NO is only responsible for spectrum management, and SPs are accountable for their users' quality-of-service (QoS) management.
The following statements are proved:


- There exists one Nash equilibrium in the conjectural prices.
- Given the conjectural prices, the SPs have to reveal their value function truthfully.
- The Nash equilibrium results in efficient rate allocation over the virtualization framework. Thus, NO has the incentive to compute the Nash equilibrium point in conjectural prices and feedback to SPs, while SPs have the incentives o follow NO's feedback.


It is shown that by using learning methods, NO and SPs can compute the conjectural prices and the value functions, respectively, without requiring the knowledge of the time-varying channel and traffic dynamics.
The following diagram shows the learning algorithm used by SPs and NO. This iterative online learning algorithm converges to the optimal conjectural prices and the value functions.

## Introduction
Wireless Network Virtualization (WNV) is a concept that can be wildly used in recent networks and facilitate a flexible and lower complexity solution for service customization. A broadband wireless network that can support various services over the same physical network is considered. The roles in the network are divided into two parts: service providers (SP) and network operators (NO). The two fundamental mechanisms which help us deal with the problem are Vickrey-Clarke–Groves (VCG) mechanism and conjectural pricing.

Each SP has a specific utility function that can be determined concerning the objectives and constraints of that SP. When the utilities are known, then NO is responsible for deciding the accessibility of the available spectrum by SPs. The NO has global information about the whole network, and it is in a perfect position to advertise conjectural prices to SPs to guide their bidding decisions. SPs bid for the network resources on behalf of the end-users. As the channel and traffic dynamics change stochastically, a stochastic game exists among SPs.

## System Model Review
One NO is considered in the proposed system. Users can subscribe to one or more SPs separately. NO manages the scheduling using the most recent channel state information (CSI) provided by the mobile users and each SP's most recent value function. SPs don't have CSI information and only view the traffic states of their own users.
The system is considered to be time-slotted, and the NO makes scheduling decisions every W seconds. The channel gain is constant within the frame but changes across frames. The channel gain profile of each user is assumed to be known to both user and the NO. The TDMA-like channel access is assumed to be deployed, and the total power is normalized to one. 

<br/><br/>

<p align="center">
  <img width="520" src="https://user-images.githubusercontent.com/66460485/132947130-7faa0923-94f1-448f-93ef-15767859375b.png">
</p>
Each end-user is subscribed to only one service in the network. The long-term average utility user receives is computed as:
<p align="center">
  <img width="150" src="https://user-images.githubusercontent.com/66460485/132947325-aace64b7-2405-4776-8e1e-84a0a12678b4.png">
</p>
The satisfaction function of SP_i can be interpreted as the willingness-to-pay (WTP) function of that SP and is a linear function:
<p align="center">
  <img width="150" src="https://user-images.githubusercontent.com/66460485/132947328-33cb29a3-58c2-4cbd-8327-3456e219894c.png">
</p>
A simple mechanism named Vickrey–Clarke–Groves (VCG) is used for pricing. The NO performs the rate allocation within the feasible rate region as follows:
<p align="center">
  <img width="180" src="https://user-images.githubusercontent.com/66460485/132947332-338e038d-30fe-4340-94fc-a73c957737ad.png">
</p>

### Stochastic Game Formulation
### Playing Stochastic Game via Conjectural Price
### Conjectural Price Selection
### Distributed Implementation and Online Learning

## Simulations
