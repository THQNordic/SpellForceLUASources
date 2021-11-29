-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 518.881348 , 259.905212 , 37.278641 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.3);]] )
   Camera:MotionSpline_AddSplinePoint( 518.881348 , 259.905212 , 37.278641 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 518.881348 , 259.905212 , 37.278641 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 518.881348 , 259.905212 , 37.278641 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
