-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 450.091766 , 353.547272 , 24.222330 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(4177);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3);]] )
   Camera:MotionSpline_AddSplinePoint( 449.676544 , 353.585327 , 24.222330 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.209564 , 353.628113 , 24.222330 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 448.744080 , 353.665955 , 24.222330 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
