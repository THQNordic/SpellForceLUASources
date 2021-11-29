-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 503.602844 , 243.231674 , 36.944759 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(3037);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 509.394043 , 243.804611 , 39.744759 , 16.700027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 515.982849 , 243.350113 , 41.744759 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 521.858765 , 244.333786 , 43.784760 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
