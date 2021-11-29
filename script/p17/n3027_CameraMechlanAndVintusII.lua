-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 434.222015 , 577.595093 , 213.659134 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(2619);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 431.510010 , 576.395386 , 213.659134 , 7.699995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 430.479706 , 575.785400 , 213.659134 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.909760 , 575.329163 , 213.659134 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
