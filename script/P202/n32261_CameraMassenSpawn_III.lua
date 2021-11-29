-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 553.993713 , 515.197083 , 42.821735 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(588.964,483.635,40.235);]] )
   Camera:MotionSpline_AddSplinePoint( 562.847412 , 506.504700 , 42.721737 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 569.863892 , 496.371948 , 43.201736 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 571.244873 , 483.186920 , 44.071735 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
