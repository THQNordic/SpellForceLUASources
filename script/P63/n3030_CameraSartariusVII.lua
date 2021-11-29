-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 582.969116 , 399.228760 , 59.866692 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 585.251953 , 398.273773 , 59.866692 , 10.600004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 585.251953 , 398.273773 , 59.866692 , 10.600004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 585.251953 , 398.273773 , 59.866692 , 10.600004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 531.130371 , 308.004974 , 59.284557 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 531.130371 , 308.004974 , 59.284557 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 531.130371 , 308.004974 , 59.284557 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 531.130371 , 308.004974 , 59.284557 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
