-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 316.241028 , 426.400452 , 36.245090 , 19.000036 , [[Camera:ScriptSplineLookAtNpc(7010);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 316.241028 , 426.400452 , 36.245090 , 12.600012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.241028 , 426.400452 , 36.245090 , 18.900036 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.241028 , 426.400452 , 36.245090 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
