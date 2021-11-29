-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 607.279297 , 376.534454 , 63.452988 , 19.600039 , [[Camera:ScriptSplineLookAtPosition(591.440,382.815,60.500);]] )
   Camera:MotionSpline_AddSplinePoint( 607.279297 , 376.534454 , 62.452988 , 14.000017 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 607.279297 , 376.534454 , 62.452988 , 19.500038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 607.279297 , 376.534454 , 62.452988 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
