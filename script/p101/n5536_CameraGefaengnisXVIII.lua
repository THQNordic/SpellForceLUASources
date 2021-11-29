-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 348.561768 , 157.299774 , 46.961731 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(361.448,170.175,30.790);]] )
   Camera:MotionSpline_AddSplinePoint( 348.561768 , 157.299774 , 46.961731 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 348.561768 , 157.299774 , 46.961731 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 348.561768 , 157.299774 , 46.961731 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
