-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 280.040985 , 126.471970 , 21.434217 , 14.800020 , [[Camera:ScriptSplineLookAtPosition(284.498,133.846,19.630);]] )
   Camera:MotionSpline_AddSplinePoint( 281.805573 , 125.812637 , 21.504217 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 283.558899 , 125.157509 , 21.574217 , 14.700020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 285.308502 , 124.503777 , 21.634218 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
