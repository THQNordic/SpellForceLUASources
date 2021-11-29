-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 424.466797 , 192.699921 , 44.042458 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(411.303,201.187,44.000);]] )
   Camera:MotionSpline_AddSplinePoint( 428.878723 , 197.449265 , 44.042458 , 20.000040 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 428.873718 , 204.140976 , 44.042458 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 426.003815 , 209.937805 , 44.042458 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
