-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 545.820923 , 576.703430 , 61.023514 , 24.800058 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 546.697632 , 575.162537 , 61.613922 , 16.900028 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 548.176270 , 574.414551 , 62.533226 , 24.700058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 549.676697 , 573.662415 , 62.533226 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
