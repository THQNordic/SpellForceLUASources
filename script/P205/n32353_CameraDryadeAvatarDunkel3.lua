-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 321.150543 , 393.793213 , 17.515951 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 321.150543 , 393.793213 , 17.515951 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 321.150543 , 393.793213 , 17.515951 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 321.150543 , 393.793213 , 17.515951 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
