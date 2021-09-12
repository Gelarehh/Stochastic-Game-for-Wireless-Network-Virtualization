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
<br/><br/>
<p align="center">
  <img width="150" src="https://user-images.githubusercontent.com/66460485/132947325-aace64b7-2405-4776-8e1e-84a0a12678b4.png">
</p>
The satisfaction function of SP<sub>i</sub> can be interpreted as the willingness-to-pay (WTP) function of that SP and is a linear function:
<br/><br/>
<p align="center">
  <img width="150" src="https://user-images.githubusercontent.com/66460485/132947328-33cb29a3-58c2-4cbd-8327-3456e219894c.png">
</p>
where a<sub>k</sub> is the weight of the user k.

A simple mechanism named Vickrey–Clarke–Groves (VCG) is used for pricing. The NO performs the rate allocation within the feasible rate region as follows:
<br/><br/>
<p align="center">
  <img width="210" src="https://user-images.githubusercontent.com/66460485/132947332-338e038d-30fe-4340-94fc-a73c957737ad.png">
</p>
where θ<sub>i</sub>(r) is the value function of SP<sub>i</sub> over the potential allocated rate.

### Playing Stochastic Game via Conjectural Price
Assume that the VCG mechanism is fixed during each frame. The policy Π<sub>i</sub> of SP is a plan to play the game. The long-term discounted average utility for SP is shown as:
<br/><br/>
<p align="center">
  <img width="210" src="https://user-images.githubusercontent.com/66460485/132947621-188f319f-d2a8-4246-a9d0-7b8b9558f60f.png">
</p>
The best response of SP<sub>i</sub> to the policy Π<sub>-i</sub> of other SPs is represented by:
<br/><br/>
<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/66460485/132947647-fed32042-d3ea-426f-929f-fe53cd757034.png">
</p>

We can split the stochastic game into two phases: current resource allocation (CurRA) game (i.e., the stage game at the current frame) and future resource allocation (FutRA) game (which is also a stochastic game starting from different states of the SPs). The output of the CurRA game will affect the initial states of all SPs in the FutRA game.
Any stationary policy played by the SPs in the FutRA game can induce one Nash equilibrium policy played in the CurRA game with the state s. Instead of directly finding the Nash equilibrium in the FutRA game, we are interested in those policies that lead to decoupling in the payoff function.

The conjectural price is the belief of SP<sub>i</sub> on the per-unit cost (charged by the NO) on the allocated rate (by the NO) in the FutRA game. The best response of SP for the CurRA game with state profile can be expressed as:
<br/><br/>
<p align="center">
  <img width="380" src="https://user-images.githubusercontent.com/66460485/132947762-b798e1a2-436b-42dd-afd6-f882d5631ab0.png">
</p>
The coupling in the payoff from the general policies played in the FutRA game prohibits the computation of the best response in the CurRA game. Conjectural prices remove this coupling. Once the conjectural prices are fixed, the curRA game is played independently of the FutRA game.

### Conjectural Price Selection
From the perspective of the NO, the efficient resource allocation is to cooperatively maximize the sum utility of all wireless users as given by:
<br/><br/>
<p align="center">
  <img width="400" src="https://user-images.githubusercontent.com/66460485/132947865-5d259442-9eaa-4f45-a820-d121992aa26e.png">
</p>
The best conjectural price can be selected by solving the following problem.
<br/><br/>
<p align="center">
  <img width="210" src="https://user-images.githubusercontent.com/66460485/132947906-d9d1f353-fefc-437c-be84-ba81ae0773aa.png">
</p>
The NO would like all the SPs to adopt this efficient price profile. λ<sup>*</sup> results in the efficient rate allocation in the CurRA game and is the Nash equilibrium of the FutRA game in the stochastic game. When the SPs are enforced to take the conjectural prices to play the FutRA game, one Nash Equilibrium is the efficient price λ<sup>*</sup>. Furthermore, given the Nash equilibrium, the SPs play the CurRA game by truthfully revealing the value function that results in the efficient rate allocation. This truthful revelation actually leads to the dominant equilibrium in the CurRA game.

### Distributed Implementation and Online Learning
As traffic states and the channel condition distribution are not available a priori, to find the conjectural price profile these information must be learned over time. We can define the traffic state just before the packet arrival as a post-decision traffic state.
<br/><br/>
<p align="center">
  <img width="415" src="https://user-images.githubusercontent.com/66460485/132947945-9eb377cc-69b3-43bd-b415-ae06fbed4a45.png">
</p>

The NO updates the conjectural price every ΔT >= 1 frames, and the SPs updates the post-state-value function for each associated user at every frame. The algorithms for updating the conjectural prices and state-value functions are as follows:
<br/><br/>
<p align="center">
  <img width="430" src="https://user-images.githubusercontent.com/66460485/132948020-ae78ee69-dadd-4ca7-8cbf-60df7b0fdd86.png">
</p>

### Theorem (Nash Equilibrium of Conjectural Price)
λ<sup>*</sup> results in the efficient rate allocation in the CurRA game and is the Nash equilibrium of the FutRA game in the stochastic game when SPs are charged with the additional payments as follows:
<p align="center">
  <img width="310" src="https://user-images.githubusercontent.com/66460485/132981893-ce049ac1-ce48-494f-a0b6-79645b716656.PNG">
</p>
with large enough A >= 0.

## Simulations
It is shown that when the SP accepts the conjectural price which is determined by the NO, its utility will be maximized.
Here we assume that SP 1 does not follow the conjectural price for User 1 advised by the NO. The optimal conjectural price for the first user is approximately equal to 5. Instead, SP 1 chooses the price arbitrarily from 2 to 8. The utility is computed with A=10.

As a practice, the simulation of the original paper is re-simulated, with the corresponding codes being attached to the repository.

- simulation of the paper
<p align="center">
  <img width="450" src="https://user-images.githubusercontent.com/66460485/132982020-8b88594a-c102-4b88-be03-e0ca088c1996.png">
</p>

- performed simulation
<p align="center">
  <img width="450" src="https://user-images.githubusercontent.com/66460485/132982037-afda9d19-6ef7-4fe1-b3b5-6aad57b212f0.png">
</p>

