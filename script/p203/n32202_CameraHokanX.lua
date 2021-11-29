-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 681.443420 , 541.519409 , 10.916693 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(668.553,551.253,13.240);]] )
   Camera:MotionSpline_AddSplinePoint( 673.443420 , 539.519409 , 10.916693 , 7.999995 , [[Camera:ScriptSplineLookAtApproachingModifier(0.02);
Camera:ScriptSplineLookAtPosition(646.166,566.649,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 658.443420 , 544.519409 , 10.916693 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 651.443420 , 551.519409 , 12.916693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
