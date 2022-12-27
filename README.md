# Change Hz on Battery

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Installing](#installing)

## About <a name = "about"></a>
Change Hz on Battery is a script that automatically changes the screen frequency to 60/90Hz when on battery, and 144/165Hz when on AC.
This script is compatible with both Intel and AMD CPUs.

The main script code is on `Battery-Mode.ps1`.

## Getting Started <a name = "getting_started"></a>

These instructions will get this script up and running on your machine. You also need to download some third-party software to run everything properly.

### Prerequisites

Select a folder to install the script. As an example, I will use `C:\power-saving-scripts`. 

Download the repository and extract it to the folder you selected.

It should look like this:

``` powershell
C:\power-saving-scripts\scripts
```

### Download Third-Party Software (optional)
I've included the third-party software in the repository, but you can download it from the links below if you want to.
Those tools are needed to actually do some of the functionality we want to automate with the script.

1. [CRU](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)

This software creates custom resolutions for the script to change to, as they may not come by default on your device.

2. [ChangeScreenResolution](https://tools.taubenkorb.at/change-screen-resolution/)

This is a tool that allows you to change the screen frequency. You should **download it** from the link above and **put it in the bin folder**. 

In the end, it should look like this:

``` powershell
bin/ChangeScreenResolution.exe
```

### Creating a Custom Resolution
I created two new custom resolutions with `60Hz` and `90Hz` to use when on battery. And *I recommend* you do so as well.

You can check this video for more information on how to do it:

[![Custom Resolution Utility - tutorial](https://img.youtube.com/vi/z8IxA-kKscA/hqdefault.jpg)](https://www.youtube.com/watch?v=z8IxA-kKscA)

## Installing <a name = "installing"></a>

**1. Edit the values on the script**

After creating your custom resolution, you need to set the correct values for your Display that correspond to your model. 

Those variables are on `scripts/Battery-Mode.ps1`

I have a *DELL G15 5515* with a *165Hz screen*, and I want to run *90Hz on battery*. 

So I set the following values:

``` powershell
$DisplayHzOnBattery = 90
$DisplayHzDefault = 165
```

**2. Test that you can change your display frequency**

To test that you can change your display frequency, you can run the following command: 

Remember to create the custom resolutions on CRU first and use the frequency value you created (in my case, 90Hz):

Go to the bin folder where the .exe is, Shift + click on the folder to open a Powershell window.
And run the following command:

``` powershell
bin/ChangeScreenResolution.exe /d=0 /f=90
```

If everything goes well, you can go to the next step.

**3. Custom Power Plan (Optional)**

In the scripts folder, I have provided a custom power plan that I use, you can use it or create your own.

For AC it uses the Balanced power plan, and for battery, it uses a slightly tweaked Power Saver power plan with Turbo Boost disabled.

When running on battery the CPU frequencies are more steady and tend to stay in the 2GHz range, which is good for battery life.

To install the power plan, *Shift + click* on the file and run it with Powershell. The new power plan will appear on the Power Options.

``` powershell
Import-Power-Plan.ps1
```

Now go and set this power plan as the default for your Windows on:
```
Control Painel\Hardware and Sound\Power Options
```

**4. Register the scripts to run on battery and AC**

Run `Register-Battery-Tasks.ps1` with Powershell (right-click the file and click on Run With Powershell), it will register the scripts to run on battery and AC automatically as a Task on Windows.


