# Robotic Sorting Arm — MATLAB & Simulink Project

This repository documents my learning curve from basic robotics concepts to a full-scale 4-DOF robotic sorting system in MATLAB & Simulink. The final project uses computer vision and kinematics to autonomously sort components.

---

## 📁 Repository Structure

### 1. Preliminary Simulations  
[`some_sim/`](https://github.com/yassa404/Robotics_MATLAB/tree/main/some_sim)  
Learning exercises covering:
- Jacobian & Velocity Kinematics
- Design Articulated Robot (RRR)
- Robot Dynamics and PID Control
- SCARA Robot Inverse/Forward Kinematics

### 2. Main Project  
[`4_dof_project/`](https://github.com/yassa404/Robotics_MATLAB/tree/main/4_dof_project)  
Contains all final files for the 4-DOF robotic sorting arm:

- [`robot66.mat`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/robot66.mat) — **Run this first** to load robot variables  
- [`dof_4.slx`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/dof_4.slx) — Main Simulink model  
- [`test3.m`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/test3.m) — Workspace validation script  
- [`simulation6_5.slx`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/simulation6_5.slx) — Full simulation

**Media & Visuals**:
- ![Simulink Model](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/folward%20and%20inverse%20simulink.jpg)
- ![Position4](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/position4.jpg)
- ![Position3](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/position3.jpg)
- [Simulation Video (AVI)](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/simulation6_5.avi)

---

## 📝 Project Overview

- Sorts components by shape (square, cube, or circle detected with computer vision)
- Robot moves across 8 programmed waypoints for safe pick/place
- Workflow based on kinematics (inverse/forward) in MATLAB & Simulink
- Workspace validation with automated out-of-bound checking

**Technologies:**
- MATLAB, Simulink (`Simscape`, `Robotics Toolbox`)
- Custom control/kinematics code

---

## 🚀 How To Run

1. Clone/download this repository.
2. In MATLAB, add `/4_dof_project` to your path.
3. Load robot variables: open or run [`robot66.mat`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/robot66.mat)
4. Open [`dof_4.slx`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/dof_4.slx) for the Simulink model.
5. Run [`simulation6_5.slx`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/simulation6_5.slx) to simulate.
6. [Optional] To test workspace limits, run [`test3.m`](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/test3.m).

---

## ⚙️ Problems & Solutions

- **Gripping parallel parts:** Some components lay parallel to the ground—makes it hard for the joint to pick.
  - _Solution:_ Added "Parallel Mate" constraint in SolidWorks and imported to MATLAB.
- **Robot exceeded workspace:** Moved out of allowed zones.
  - _Solution:_ Introduced joint limits and added extra intermediate waypoints.
- **Wrong approach angle:** The robot doesn't always approach with correct orientation as per the CAD plan.
  - _Solution:_ Plan to add orientation constraint in inverse kinematics.
- **Trajectory issues:** Movement paths were not as expected due to coordinate mismatch from SolidWorks.
  - _Solution:_ Reset the model origin position.
- **Simulation errors:** Initial simulation errors fixed during test/debug.

---

## 🎬 Demo Media

- [Simulation Video (AVI)](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/simulation6_5.avi)
- ![Simulink Model](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/folward%20and%20inverse%20simulink.jpg)
- ![Position 4](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/position4.jpg)
- ![Position 3](https://github.com/yassa404/Robotics_MATLAB/blob/main/4_dof_project/position3.jpg)

> _Tip: To display the video as a GIF or preview, convert and re-upload as GIF/MP4, or host on YouTube for embedding._

---

## 👤 Credits

- Yassi Mazher Faiz
- Ali Ezzat

Contact for questions or contributions via issues.

---
