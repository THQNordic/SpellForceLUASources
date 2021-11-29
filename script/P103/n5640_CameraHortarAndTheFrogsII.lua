-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 462.840668 , 571.275452 , 19.015238 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5640);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 461.449188 , 569.939819 , 33.764545 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 461.449188 , 569.939819 , 33.764545 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 461.449188 , 569.939819 , 33.764545 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
