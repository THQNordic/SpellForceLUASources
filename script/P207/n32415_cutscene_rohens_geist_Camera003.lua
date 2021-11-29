-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 378.600006 , 60.200001 , 90.253647 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(382.433,57.300,88.650);]] )
   Camera:MotionSpline_AddSplinePoint( 378.600006 , 60.200001 , 90.253647 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 378.600006 , 60.200001 , 90.253647 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 378.600006 , 60.200001 , 90.253647 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
