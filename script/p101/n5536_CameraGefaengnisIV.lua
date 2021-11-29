-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 354.859863 , 173.218033 , 36.574463 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2);]] )
   Camera:MotionSpline_AddSplinePoint( 355.683533 , 170.976395 , 34.804401 , 5.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 357.400635 , 166.943054 , 34.854465 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 359.798279 , 162.439758 , 36.904465 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
