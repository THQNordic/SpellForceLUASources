-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 584.295776 , 383.371613 , 50.275738 , 60.199654 , [[Camera:ScriptSplineLookAtPosition(611.919,397.194,32.000);]] )
   Camera:MotionSpline_AddSplinePoint( 589.077820 , 378.562225 , 52.265636 , 34.300049 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 593.865051 , 373.747498 , 56.155605 , 60.099655 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 603.447998 , 368.929688 , 59.665585 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
