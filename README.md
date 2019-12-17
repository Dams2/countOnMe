# **README 🔥** 

This architecture is split in differents layers/concepts 🏋️‍♀️:

ViewController
ViewModel
Helper
Calculator
Tests


## **Intro**

CountOnMe is a calculator application for iPhone. This project is representing at this time my guideline for every workdays. ( This project is related to my studies on OpenClassrooms )

## **Architecture**

###### **ViewModel :**

The ViewModel encapsulates the whole logic which doesn't have to be in the ViewController. It's divided in two parts :

Inputs: Every event from the viewController needs to be implemented in the viewModel, since it's listening for them. The main event which always need to be added is viewDidLoad().
Outputs: After viewDidLoad(), the viewController is listening for some changes from the viewModel. For this, the viewModel needs to provide reactive var for each data/state needed. The main rule is to keep separate the UI logic between viewModel and viewController, so keep in mind that a viewModel can only import Foundation -> reactive var con't provide data from UIKit like UIImage for example ☝️

###### **Helper:**

Helper is a layer that groups functions needed for ViewModel properties

###### **Calculator:**

Calculator is a layer that groups functions needed for ViewModel properties

###### **ViewController:**

The last layer and not the less important 🙇‍♂️. But as it is mentioned in it's name, a ViewController only exists for control. So, if you want to test it, you'll only provide UI test, since the logic is extracted in the corresponding ViewModel. I recomand to add a custom snapshot to test it correctly. (Not provided in this project). 

###### **Tests:**

They represent a verification procedure and they must test the proper functioning of properties and commands.

Press cmd+u and let the magic green life be.

Thank you for you time to reading this, I hope that you'll have as pleasure as me to read it and understand the different parts.
