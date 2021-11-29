-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 363.193390 , 174.468506 , 30.409145 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5937);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.3);]] )
   Camera:MotionSpline_AddSplinePoint( 363.193390 , 174.468506 , 30.409145 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 363.193390 , 174.468506 , 30.409145 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 363.193390 , 174.468506 , 30.409145 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
