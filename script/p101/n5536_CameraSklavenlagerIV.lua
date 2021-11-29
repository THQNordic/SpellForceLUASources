-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 131.749252 , 20.002100 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5536);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 131.749252 , 20.002100 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 131.749252 , 20.002100 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 284.182892 , 131.749252 , 20.002100 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
