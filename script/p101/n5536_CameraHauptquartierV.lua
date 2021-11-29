-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 317.489868 , 414.604584 , 33.015221 , 19.100037 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 317.489868 , 414.604584 , 33.015221 , 12.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 317.489868 , 414.604584 , 33.015221 , 19.000036 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 317.489868 , 414.604584 , 33.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
