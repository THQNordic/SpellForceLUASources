-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 511.211670 , 470.756287 , 56.799370 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(1984);]] )
   Camera:MotionSpline_AddSplinePoint( 524.813660 , 456.050171 , 54.389366 , 13.400015 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 539.513611 , 458.952209 , 52.269371 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 549.109436 , 472.756287 , 48.309364 , 0.000000 , [[Camera:ScriptSplineModifyCursorSpeed(0.05);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
