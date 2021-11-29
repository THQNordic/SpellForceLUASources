-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 462.043365 , 535.320313 , 28.729099 , 29.900078 , [[Camera:ScriptSplineLookAtNpc(7001);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 455.631958 , 531.034485 , 28.299164 , 7.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 441.017639 , 526.615784 , 27.559280 , 15.500023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 415.473907 , 533.059387 , 27.259113 , 22.700050 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 401.211639 , 550.411194 , 27.659096 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 398.912231 , 572.989380 , 27.639153 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
