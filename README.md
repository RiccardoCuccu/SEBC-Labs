# SEBC-Labs
Laboratory sessions from the "Sistemi Elettronici a Basso Consumo" course (Low-Power Electronic Systems), part of the Master's degree in Embedded Systems (Electronic Engineering) at Politecnico di Torino, academic year 2019/2020. The detailed report is available in the [sebc_gr21_2019.pdf](sebc_gr21_2019.pdf) file.

### Lab 1. **Power Estimation: Probabilistic Techniques**
The first set of exercises focused on the **calculation of probability** and **switching activity** for basic logic gates such as **INV, AND, OR,** and **XOR**. Using a probabilistic approach, the activities were estimated based on the assumption of uncorrelated and equiprobable inputs. The results were verified through **circuit simulations** using **ModelSim**, where different durations of simulation provided insights into how closely the experimental results approached theoretical predictions. This section also covered the **Ripple Carry Adder (RCA)**, analyzing its output probability and activity under different input conditions, and the impact of **glitch generation** due to non-zero carry delay.

### Lab 2. **FSM State Assignment and VHDL Synthesis**
This lab explored **Finite State Machines (FSMs)** with a focus on state assignment and synthesis using **VHDL**. The exercises included the synthesis of an **FSM-based adder** and an analysis of how different state assignments influence power consumption and performance. The structural VHDL synthesis highlighted the importance of efficient state encoding for low-power design.

### Lab 3. **Clock Gating, Pipelining, and Parallelizing**
The third lab delved into advanced techniques for reducing power consumption, such as **clock gating, pipelining,** and **parallelizing**. Initial exercises introduced basic clock gating methods, followed by applying these techniques to more complex circuits. The lab also explored the automatic annotation of activities to optimize clock gating. **Pipelining** and **parallel processing** were then analyzed for their impact on both performance and power efficiency, with particular attention to the verification of correct implementation through simulation.

### Lab 4. **Bus Encoding**
This section focused on **bus encoding techniques** to reduce power consumption in digital systems. Different encoding schemes, such as **Bus-Invert, Transition-Based, Gray,** and **T0 encoding**, were implemented and simulated. The impact of these techniques on power efficiency was measured by comparing encoded and non-encoded buses under various simulation scenarios.

### Lab 5. **Leakage: Using Spice for Characterizing Cells and Memory Organization**
The fifth laboratory session was centered on the analysis of **leakage power** in digital circuits. Using **SPICE simulations**, various library gates were characterized in terms of threshold voltage and output load. The impact of **gate sizing** and the trade-off between **high speed and low leakage** designs were evaluated. Additionally, the **temperature dependency** of leakage currents and the analysis of **memory power components** provided deeper insights into optimizing power consumption at the device level.

### Lab 6. **Functional Verification**
The final laboratory exercise involved the **functional verification** of digital designs using **VHDL** and scripting tools like **Python**. The exercises included the creation of automatic VHDL testbenches and the verification of designs such as an **RCA** and **Finite State Machines**. This section emphasized the importance of thorough verification processes to ensure correct functionality and the minimization of power consumption through proper design techniques.
