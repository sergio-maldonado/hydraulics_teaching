# hydraulics_teaching

This repository contains various codes illustrating different principles in environmental hydraulics. The codes are intended for illustrative/pedagogical purposes. A description of each code is provided below.

## dif_lagrangian.m
This Matlab code illustrates the process of diffusion arising from the random motion of individual particles; for example:  

<p align="center">
    <img src="https://github.com/sergio-maldonado/hydraulics_teaching/blob/main/images/animation_diff.gif" width="600" height="400" alt="diffusion"/>
</p>

The number of particles and the length of the random walk can be changed. 

A uniform, background velocity field can be prescribed to illustrate the combined effect of advection and diffusion. To make this clear, the trajectory of each particle can be tracked, as shown in the image below.

<p align="center">
    <img src="https://github.com/sergio-maldonado/hydraulics_teaching/blob/main/images/final_dif.gif" width="600" height="400" alt="advection diffusion"/>
</p>

## dif_lagrangian_turbulence.m
This is similar to the previous code, but it allows to model "pseudo-turbulence" - meaning that turbulence is here simply modelled as random fluctuations added to a mean velocity field (without consideration for mass or momentum conservation). The purpose of this is illustrate how this randomness can have a similar effect to diffusion. 

For example, here is the case of 100 particles (without any "diffusion"; i.e. random walks) released in a perfectly uniform flow: 

<p align="center">
    <img src="https://github.com/sergio-maldonado/hydraulics_teaching/blob/main/images/animation_diff_noturb.gif" width="600" height="400" alt="advection diffusion"/>
</p>

As expected, nothing interesting happens. However, if we add random fluctuations to the velocity field, we observe dispersive behaviour: 

<p align="center">
    <img src="https://github.com/sergio-maldonado/hydraulics_teaching/blob/main/images/animation_diff_turb.gif" width="600" height="400" alt="advection diffusion"/>
</p>

Here we see an illustration of enhanced mixing due to "turbulence":

<p align="center">
    <img src="https://github.com/sergio-maldonado/hydraulics_teaching/blob/main/images/final_dif_turbu.gif" width="600" height="400" alt="advection diffusion"/>
</p>

(to be continued...)
