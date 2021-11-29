-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 181.586563 , 459.512146 , 33.015675 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 180.154541 , 460.373749 , 33.025665 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 176.426727 , 461.838440 , 33.075676 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 172.457367 , 462.389587 , 33.135670 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
