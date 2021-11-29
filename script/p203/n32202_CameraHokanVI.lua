-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 635.598633 , 636.335205 , 20.783325 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(635.599,639.950,21.000);]] )
   Camera:MotionSpline_AddSplinePoint( 635.598633 , 636.335205 , 20.783325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 635.598633 , 636.335205 , 20.783325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 635.598633 , 636.335205 , 20.783325 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
