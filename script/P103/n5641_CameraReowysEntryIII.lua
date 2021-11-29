-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 540.732544 , 474.614655 , 47.800858 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(5639);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 545.911865 , 474.718414 , 47.300858 , 5.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 549.616089 , 474.926392 , 47.562286 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 555.812622 , 474.488007 , 48.062286 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
