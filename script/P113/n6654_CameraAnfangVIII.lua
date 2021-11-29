-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.699829 , 230.912537 , 77.119247 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6655);
Camera:ScriptSplineAddTargetLookAtOffset(-2,0,1);]] )
   Camera:MotionSpline_AddSplinePoint( 398.699829 , 230.912537 , 77.119247 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 398.699829 , 230.912537 , 77.119247 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 398.699829 , 230.912537 , 77.119247 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
