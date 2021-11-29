-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 519.382202 , 583.773682 , 14.951248 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(506.571,589.161,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 525.263184 , 579.037109 , 16.263420 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 528.874512 , 575.913940 , 15.863424 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 535.614990 , 569.555603 , 16.819414 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
