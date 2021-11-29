-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 132.749252 , 20.002100 , 37.300003 , [[Camera:ScriptSplineLookAtNpc(5537);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 132.749252 , 20.002100 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 132.749252 , 20.002100 , 37.200005 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 132.749252 , 20.002100 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
