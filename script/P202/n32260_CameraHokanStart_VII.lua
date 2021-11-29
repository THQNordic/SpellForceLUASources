-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 508.052124 , 588.263367 , 14.097626 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 508.052124 , 588.263367 , 14.097626 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 508.052124 , 588.263367 , 14.097626 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 508.052124 , 588.263367 , 14.097626 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
