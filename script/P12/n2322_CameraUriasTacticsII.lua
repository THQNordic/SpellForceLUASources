-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 557.767944 , 425.590454 , 30.872295 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(3257);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 570.975830 , 426.453400 , 26.242296 , 6.999996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 582.471802 , 426.595642 , 20.162296 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 590.542969 , 432.850983 , 16.062473 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
