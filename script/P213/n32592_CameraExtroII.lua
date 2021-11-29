-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 618.831604 , 337.035553 , 46.866692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(618.832,347.333,45.000);]] )
   Camera:MotionSpline_AddSplinePoint( 618.831604 , 337.035156 , 46.866692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 618.831604 , 337.035156 , 46.866692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 618.831604 , 337.035156 , 46.866692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
