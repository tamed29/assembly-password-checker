# 🔐 Password Strength Checker (8086 Assembly)

## 📌 Project Description

This project is a **Password Strength Checker** written in **8086 Assembly Language** using the **EMU 8086 (16-bit)** emulator.  
The program prompts the user to enter a password, analyzes its contents, and displays a strength level based on specific security rules.

This assignment is designed for a **Microprocessor and Assembly Language** course and demonstrates practical use of conditional logic, loops, registers, and DOS interrupts.

---

## 🎯 Objectives

- Accept a password from the user using buffered keyboard input
- Analyze password characteristics
- Classify password strength into five levels
- Display clear feedback to the user
- Allow the user to retry or exit the program

---

## 🧠 Password Evaluation Criteria

The password is checked using the following rules:

| Condition Checked | Description                |
| ----------------- | -------------------------- |
| Length ≥ 8        | Minimum length requirement |
| Uppercase Letter  | At least one A–Z           |
| Lowercase Letter  | At least one a–z           |
| Digit             | At least one 0–9           |
| Special Character | One of: `@ # $ % !`        |

Each satisfied condition adds **one point** to the total score.

---

## 📊 Strength Levels

Based on the total score, the password is classified as:

| Score | Strength Level |
| ----- | -------------- |
| 5     | Very Strong    |
| 4     | Strong         |
| 3     | Medium         |
| 2     | Weak           |
| 0–1   | Very Weak      |

---

## 🛠️ Tools & Environment

- **Language:** 8086 Assembly (16-bit)
- **Assembler/Emulator:** EMU 8086
- **Operating Mode:** DOS (`INT 21h` services)

---

## ⚙️ Program Flow

1. Display program header and user information
2. Prompt user to enter a password
3. Scan each character and detect:
   - Uppercase letters
   - Lowercase letters
   - Digits
   - Special characters
4. Calculate password score
5. Display password strength
6. Ask user if they want to try again
7. Exit program gracefully

---

## 📁 File Information

- **File Name:** `password.asm`
- **Execution Type:** `.COM` program (`ORG 100h`)

---

---

## ✅ Conclusion

This program provides a clear and structured example of applying logical conditions and character analysis in **8086 Assembly Language**.  
It meets the assignment requirements and follows clean, readable, and professional coding practices suitable for academic submission.

---
