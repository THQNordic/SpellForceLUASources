-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 623.937195 , 398.095612 , 47.964531 , 60.199654 , [[Camera:ScriptSplineLookAtPosition(623.153,398.098,34.000);]] )
   Camera:MotionSpline_AddSplinePoint( 627.392395 , 398.083923 , 48.284489 , 21.300045 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 634.070740 , 398.061340 , 47.204521 , 35.200035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 639.516541 , 397.948120 , 43.334530 , 48.099838 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 642.990906 , 398.031189 , 38.264545 , 60.099655 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 645.455933 , 398.212463 , 33.104534 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
